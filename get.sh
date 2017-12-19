# generate symmetric key if none exists
if [ ! -f key.txt ]; then
    echo "no key found :("
    exit -1
fi

# get wan ip via scp
scp uberspace:susanneswordclock/ip.gl ip.gl

# decrypt ip
myipdecrypted=$(openssl rsautl -inkey key.txt -decrypt < ip.gl)

# print wan ip
echo $myipdecrypted


