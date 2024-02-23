alias editworlalias='nvim ~/.config/work-aliases.zsh'

# Database
alias startsql='podman container start mysql-onprem'
alias stopsql='podman container stop mysql-onprem'
alias startinfluxdb='podman container start influxdb'
alias createsql='(\cd ~/workspace/sidel/sidel-sql && podman run -d --name mysql-onprem -e MYSQL_ROOT_PASSWORD=root -p 3366:3306 --network sidel-sql --network-alias mysql biarms/mysql:5.7 --sql_mode="ONLY_FULL_GROUP_BY" --default-time-zone="+00:00")'
alias runsqlmigration='(\cd ~/workspace/sidel/sidel-sql && podman start mysql-onprem && podman build -t sidel-migration-tool -f migration_tool/build/Dockerfile-macos . && podman run --rm -it -e MYSQL_USER=root -e MYSQL_PASSWORD=root -e MYSQL_HOST=mysql -e MYSQL_PORT=3306 -e API_BACK_PASSWORD=api_back -e DTM_LIVE_LOCAL_PASSWORD=dtm_live_local --name sidel-migration-tool --network sidel-sql sidel-migration-tool)'
alias buildsql='(\cd ~/workspace/sidel/sidel-sql && podman build -t sidel-migration-tool -f migration_tool/build/Dockerfile-macos .)'
alias connectsqllocal='mycli -u root -h localhost -P 3366 -p root'
alias connectsqllocaleit='mycli -u root -h localhost -P 3366 eit_v7 -p root'
alias checklocalmigration='mycli -u root -h localhost -P 3366 eit_v7 -p root -e "select * from _migrations order by id desc limit 5" | column -t'

# GCP
alias gcpdeve="gcloud config configurations activate sidel-deve-back"
alias gcpprod="gcloud config configurations activate sidel-prod-back"

# gita
alias pullall='gita super sidel-all pull'
alias swdall='gita super sidel-all switch developpement'
alias pullfb='gita super sidel-fb pull'
alias gswfb='gita super sidel-fb switch'
alias gswfbd='gswfb developpement && pullfb'
alias resetsideldev='swdall && pullall'
alias resetsideldevhard='gita super sidel-all restore . && swdall && pullall'

# env management
setcloudenv() {
	echo "Setting cloud env..."
	cp ~/workspace/sidel/sidel-back/.env.dev ~/workspace/sidel/sidel-back/.env
	cp ~/workspace/sidel/sidel-front/src/environments/environment.env.ts ~/workspace/sidel/sidel-front/src/environments/environment.ts 
	cp ~/workspace/sidel/sidel-recovery-machine/.env.dev ~/workspace/sidel/sidel-recovery-machine/.env 
	echo "Cloud env set"
}

setonpremenv() {
	echo "Setting on-premise env..."
	cp ~/workspace/sidel/sidel-back/.env.onpremise ~/workspace/sidel/sidel-back/.env
	cp ~/workspace/sidel/sidel-front/src/environments/environment.opremise.ts ~/workspace/sidel/sidel-front/src/environments/environment.ts 
	cp ~/workspace/sidel/sidel-recovery-machine/.env.on-premise ~/workspace/sidel/sidel-recovery-machine/.env 
	echo "On-premise env set"
}

# Process management
alias openprosys='open -a Prosys\ OPC\ UA\ Simulation\ Server'
alias closeprosys='osascript -e "quit app \"Prosys OPC UA Simulation Server\"" &'

alias startevocloud="setcloudenv ; stopdtm ; stoprecovery ; stopscheduler ; startproxydev ; startsidelback ; startsidelfront"
alias startdtm="startdtmback ; startdtmfront ; openprosys"
alias startevoonprem="setonpremenv ; stopproxydev ; startsql ; startsidelback ; startsidelfront"
alias startfullevoonprem="openprosys ; startevoonprem ; startinfluxdb ; startdtm ; startscheduler ; startrecovery"

alias stopevo='pm2 stop sidel-front sidel-back proxy-dev > /dev/null'
alias stopdtm='pm2 stop dtm-back dtm-front > /dev/null ; closeprosys'
alias stopproxydev='pm2 stop proxy-dev > /dev/null'
alias stopproxyprod='pm2 stop proxy-prod > /dev/null'
alias stopall='pm2 stop all > /dev/null ; closeprosys'
alias stoprecovery='pm2 stop sidel-recovery-machine > /dev/null'
alias stopscheduler='pm2 stop task-scheduler > /dev/null'

alias pmrf='pm2 restart sidel-front'
alias pmrb='pm2 restart sidel-back'

startsidelfront() {
	if [[ -z $(pm2 pid sidel-front) ]] then
		echo "start sidel-front"
    (\cd ~/workspace/sidel/sidel-front && fnm use > /dev/null && pm2 start "npm run start" --name "sidel-front" --error "~/.pm2/logs/sidel-front.log"  --output "~/.pm2/logs/sidel-front.log" > /dev/null)
	else
		echo "restart sidel-front"
    pm2 restart sidel-front > /dev/null
	fi
}

startsidelback() {
	if [[ -z $(pm2 pid sidel-back) ]] then
		echo "start sidel-back"
    (\cd ~/workspace/sidel/sidel-back && fnm use > /dev/null && pm2 start "npm run start:dev" --name "sidel-back" --error "~/.pm2/logs/sidel-back.log" --output "~/.pm2/logs/sidel-back.log" > /dev/null)
	else
		echo "restart sidel-back"
    pm2 restart sidel-back > /dev/null
	fi
}

startproxydev() {
	if [[ -z $(pm2 pid proxy-dev) ]] then
		echo "start proxy-dev"
    (\cd ~/workspace/sidel/sidel-back && fnm use > /dev/null && pm2 start "npm run proxy:dev-file" --name "proxy-dev" --error "~/.pm2/logs/proxy-dev.log" --output "~/.pm2/logs/proxy-dev.log" > /dev/null)
	else
		echo "restart proxy-dev"
    pm2 restart proxy-dev > /dev/null
	fi
}

startproxyprod() {
	if [[ -z $(pm2 pid proxy-prod) ]] then
		echo "start proxy-prod"
    (\cd ~/workspace/sidel/sidel-back && fnm use > /dev/null && pm2 start "npm run proxy:prod-file" --name "proxy-prod" --error "~/.pm2/logs/proxy-prod.log" --output "~/.pm2/logs/proxy-prod.log" > /dev/null)
	else
		echo "restart proxy-prod"
    pm2 restart proxy-prod > /dev/null
	fi
}

startdtmfront() {
	if [[ -z $(pm2 pid dtm-front) ]] then
		echo "start dtm-front"
    (\cd ~/workspace/sidel/dtm-live-front && fnm use 16 > /dev/null && pm2 start "npm run start" --name "dtm-front" --error "~/.pm2/logs/dtm-front.log" --output "~/.pm2/logs/dtm-front.log" > /dev/null)
	else
		echo "restart dtm-front"
    pm2 restart dtm-front > /dev/null
	fi
}

startdtmback() {
	if [[ -z $(pm2 pid dtm-back) ]] then
		echo "start dtm-back"
    (\cd ~/workspace/sidel/dtm-live && fnm use 16 > /dev/null && pm2 start "npm run start:dev" --name "dtm-back" --error "~/.pm2/logs/dtm-back.log" --output "~/.pm2/logs/dtm-back.log" > /dev/null)
	else
		echo "restart dtm-back"
    pm2 restart dtm-back > /dev/null
	fi
}

startscheduler() {
	if [[ -z $(pm2 pid task-scheduler) ]] then
		echo "start task-scheduler"
    (\cd ~/workspace/sidel/task-scheduler && fnm use 16 > /dev/null && pm2 start "npm run start:dev" --name "task-scheduler" --error "~/.pm2/logs/task-scheduler.log" --output "~/.pm2/logs/task-scheduler.log" > /dev/null)
	else
		echo "restart task-scheduler"
    pm2 restart task-scheduler > /dev/null
	fi
}

startrecovery() {
	if [[ -z $(pm2 pid sidel-recovery-machine) ]] then
		echo "start sidel-recovery-machine"
    (\cd ~/workspace/sidel/sidel-recovery-machine && fnm use 16 > /dev/null && pm2 start "npm run start:dev" --name "sidel-recovery-machine" --error "~/.pm2/logs/sidel-recovery-machine.log" --output "~/.pm2/logs/sidel-recovery-machine.log" > /dev/null)
	else
		echo "restart sidel-recovery-machine"
    pm2 restart sidel-recovery-machine > /dev/null
	fi
}
