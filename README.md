# srnd docker

docker automagic node setup for SRNd and overchan, omgwtfbbq

## dependancies

* docker
* gnu make


## obtaining

    git clone --recursive git://github.com/majestrate/srnd-docker
    cd srnd-docker

## building

to make and deploy a new unconfigured overchan node 

    make

to get the onion address of the frontend, share this with everyone

    cat data/http/hostname

to get the onion address for others to add in their outfeeds, this is sensitive information **DO NOT SHARE LIGHTLY**

    cat data/nntp/hostname


**STOP**

# Read this

you **MUST** generate a tripcode for administration reasons

http://yourfrontend.onion/moderate?getkey

save contents and DO **NOT** LOSE IT

## configuring

in file data/data/config/SRND.conf ensure the following options are set

    bind_ip=127.0.0.1:119
    instance_name=overchan.some.name.here
    

in file data/install_files/config/hooks/plugins/overchan

find line like

    #start_param title=.....

and change to

    #start_param title=overchan.some.name.here


in file data/data/plugins/postman/frontends/overchan

find line like

    uid_host=....

and change to

    uid_host=overchan.some.name.here

add your *public* part of the admin tripcode in file data/data/config/hooks/plugins/censor

    #start_param add_admin=public_key_goes_here


## peering

### requirements

* someone running another srnd instance
* secure line of communication

### steps

step 1) Exchange nntp addresses with friend

    <you> ?OTR?
    ... establish otr covno :^)
    <you> what is your nntp address?
    <friend> xxx.onion
    <friend> what's your nntp address
    <you> yyy.onion
    

step 2) Add your friend's nntp address to your outfeeds

    cp default.feed 'data/data/config/hooks/outfeeds/xxx.onion:119'

step 3) restart srnd

    docker kill overchan
    make

### removing outfeeds

    rm -f 'data/data/config/hooks/outfeeds/xxx.onion:119'


## administration

to moderate your frontend go to http://yourfrontend.onion/moderate/

use the *SECRET* part of the tripcode

explore the login panel and get used to stuff


## tips

    # have overview be the index page
    cd data/data/plugins/overchan/out
    ln -s overview.html index.html
