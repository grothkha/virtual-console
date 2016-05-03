#!/usr/bin/env bash

case $1 in
    'start' )
            if [ "$(cat scripts/NODEPID)" != "" ]; then
                 echo " already running. U need to stop before running again.."
            else


                DIR="NodeServer/node_modules"

                if [ "$(ls -A ${DIR})" ]; then
                     echo " NodeModules present, starting app.."
                else
                    echo "Prepare nodejs dependencies..."
                     bash scripts/prepareDeps.sh
                fi

                bash scripts/database.sh start
                node NodeServer/bin/www &
                PID=$!
                echo ${PID} > scripts/NODEPID
             fi
            $SHELL
        ;;
    'stop')
            bash scripts/database.sh stop

            echo "Stopping NodeJS..."
            kill -INT `cat scripts/NODEPID`
            echo "" > scripts/NODEPID
        ;;
    'prepDeps')
           echo "Prepare nodejs dependencies..."
           bash scripts/prepareDeps.sh
        ;;

    *)
    echo 'usage $0 start | stop | prepDeps'
    ;;

esac