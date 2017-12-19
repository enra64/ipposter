# generate symmetric key if none exists
if [ ! -f key.txt ]; then
    echo "Generating key, none was found" >> log.txt
    openssl genrsa -out key.txt 4096
fi

# get self wan ip
myip=$(dig +short myip.opendns.com @resolver1.opendns.com)

# encryt wan ip
myipencrypted=$(echo $myip | openssl rsautl -inkey key.txt -encrypt > ip.gl)

# log wan ip
echo "WAN IP " $myip >> log.txt

# post wan ip via ssh
scp ip.gl uberspace:susanneswordclock/ip.gl
