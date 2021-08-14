
 1 #!/bin/bash
 2
 3 liste=$(docker images | grep "none"  | awk '{print $3}')
 4 arr=( $liste ) #transformer en tableau la liste recupérer
 5 echo ${#arr[@]} #voir la taille du tabbleau
 6
 7
 8 # for i in "${liste[@]}"; do echo $i; done
 9 # gt equivaut à >
10 if [ ${#arr[@]} -gt 0  ];
11 then
12      echo ${#arr[@]}
13         for i in "${liste[@]}"; do
14            docker rmi $i -f
15         done
16        # docker rmi $(docker images | grep "none"  | awk '{print $3}')
17 fi
18
19 if [ $1 == 'develop' ]
20 then
21         echo "Preprod reload ...."
22         docker  stop  preprod-admin
23         docker rm preprod-admin
24         docker-compose up -d preprod-admin
25         docker exec  preprod-admin    /bin/sh -c "ls;php artisan migrate --force;"
26         echo "Preprod  reload successfully"
27 fi
28
29
30 if [ $1 == 'prod' ]
31 then
32         echo "Prod reload ....."
33         docker  stop  prod-admin
34         docker rm prod-admin
35         docker-compose up -d prod-admin
36         docker exec  prod-admin    /bin/sh -c "ls;php artisan migrate --force;"
37        echo "Prod reload successfully"
38 fi
39
40 #docker exec $(docker ps -a -q  --filter ancestor=154265/laravel:latest)  /bin/sh -c "ls;php artisan migrate --force;"
41
42
43 #docker exec -it  d16fd9ad9339 /bin/bash && php artisan migrate