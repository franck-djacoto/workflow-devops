#!/bin/bash

liste=$(docker images | grep "none"  | awk '{print $3}')
listimagelaravelwithouttag = $(docker images | grep "none" | grep "154265/laravel"  | awk '{print $3}') 

echo $2


arrayimagewithouttag=( $listimagelaravelwithouttag ) #transformer en tableau la liste recupérer
arr=( $liste ) #transformer en tableau la liste recupérer

echo ${#arr[@]} #voir la taille du tabbleau 
echo ${#arrayimagewithouttag[@]} #voir la taille du tabbleau

# for i in "${liste[@]}"; do echo $i; done
# gt equivaut à > 

if [ ${#arr[@]} -gt 0  ];
then
     echo ${#arr[@]}
        for i in "${liste[@]}"; do
           docker rmi $i -f
        done
       # docker rmi $(docker images | grep "none"  | awk '{print $3}')
fi


if [ ${#arrayimagewithouttag[@]} -gt 0  ];
then
     echo ${#arrayimagewithouttag[@]}

        for i in "${listimagelaravelwithouttag[@]}"; do
           docker rmi $i -f
        done
fi

if [ $2 == 'frontend' ]
 then
 
  echo "Update in Frontend...."

  if [ $1 == 'develop' ]
  then
	echo "Preprod reload ...."
        docker  stop  thetiptop-frontent
        docker rm thetiptop-frontent
        docker-compose up -d frontend
        echo "Preprod  reload successfully"
  fi

	
  if [ $1 == 'prod' ]
  then
        echo "Prod reload ....."
        docker  stop  thetiptop-frontent-prod
        docker rm thetiptop-frontent-prod
	docker-compose up -d  frontend-prod
       echo "Prod reload successfully"
   fi
fi


if [ $2 == 'backend' ]
 then

  echo "Update in Backend....."

  if [ $1 == 'develop' ]
  then
        echo "Preprod reload ...."
        docker  stop  preprod-admin
        docker rm preprod-admin
        docker-compose up -d preprod-admin
        docker exec  preprod-admin    /bin/sh -c "ls;php artisan migrate --force;"
        echo "Preprod  reload successfully"
  fi


  if [ $1 == 'prod' ]
  then
        echo "Prod reload ....."
        docker  stop  prod-admin
        docker rm prod-admin
        docker-compose up -d prod-admin
        docker exec  prod-admin    /bin/sh -c "ls;php artisan migrate --force;"
       echo "Prod reload successfully"
   fi
fi
#docker exec $(docker ps -a -q  --filter ancestor=154265/laravel:latest)  /bin/sh -c "ls;php artisan migrate --force;"
#docker exec -it  d16fd9ad9339 /bin/bash && php artisan migrate
