# begin=$(expr $(cat ./begin) + 86400) # init: 972576000
FOO=$(cat ./begin)
BAR=$(printf "%.0f" $FOO)
echo $FOO
echo $BAR
BEGIN=$(date '+%s') # init: 972576000
echo $BEGIN
END=$(expr $BAR + 86400)
echo $END




list=$(seq $BEGIN 86400 $END)
after=''


for i in $list
do
    date '+%Y-%m-%d %H:%M:%S: Nothing' >> ./README.md
    echo >> ./README.md

    echo $i > ./begin

    git add ./README.md
    git add ./begin
    git commit  --message='add'

    after='git push origin HEAD'
done

eval $after
