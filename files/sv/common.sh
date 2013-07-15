# cd to home
cd

depends_on() {
  list=$*
  for s in $list; do
    svinfo -s $s > /dev/null
    [ $? = 3 ] || exit 1
  done
}

logdir=$HOME/.log/$service
if [ "x$enable_logging" = "xtrue" ]; then
  mkdir -p $logdir
  exec 1>>"$logdir/$service.log" 2>>"$logdir/errors.log"
fi
