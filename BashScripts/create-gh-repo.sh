$USER="HiddenWaste" # Hard-coded to me for now
$BRANCH="master"    # Can change if wanted

# create the repository
gh repo create $NAME --$P

# Add the remote 
# 	(sets origin for local git database)
git remote add $NAME https://github.com/$USER/$NAME

# Normal add then commit stuffs
git add .
git commit -m "Initial Commit"

# push and set which branch on the remote we push to
git push --set-upstream $NAME $NAME


