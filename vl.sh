#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�a��bvless.sh �RMO�0��W����Ķ�-q�# ��4퐦nh�)qW����u��)�_޳_���J��p9c�� �c�F�*�=8�Y�!Ap	9����u/S�Wq��z$���4e��d�>�����RxbO�d^�v���\�Ja<��:*���(G���JNx��� �q0��@��(�w���(��]1�,U�IAp||~u�����Ұ��d����D�3,|���j�3�T���cS��y����7A��K�޹����J֐����oyQ���WU�[�.�/?f��'��P�#f���t7��v>%e�;�6���iȢ(o��I#��>6�����DVV��I�~�h�����S+ߑZ�Ĕ����oc�nB�ܢ��ez���#  