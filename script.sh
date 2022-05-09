usage() { echo "Usage:bash $0 -p <put your database name and user name.> " 1>&2; exit 1; }

if [ $# -eq 0 ];
then
	usage
else
	pwd=""
	while getopts 'p:h' c;
	do
	 case $c in
	   p) pwd=$OPTARG;;
	   h) usage;;
	   *) echo "need to specify password in command";;
	 esac
	done
fi

if [[ -n $pwd ]]; then
	HOST="locahost"
	user="wpadmin"
	password="Password!@#"
	mysql -u root -p$pwd <<EOF
	CREATE DATABASE wordpress;
	GRANT ALL PRIVILEGES ON wordpress.* TO "${user}"@"${HOST}" IDENTIFIED BY "${password};"
	FLUSH PRIVILEGES;
	exit;
EOF
fi
