#!/bin/sh
skip=38
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
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }
gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }
case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��� \script.sh ]yTSY�p!�������PC�J���B	5!H���!HD�(J��*�g��(*���f�Q�K���߼��u�9���Ϲk������3  (H	��y��A�� @A�g�������@ �TQ�t���	x���?������e��]��:\SK�"x�w�[	��G.��af�O�ȆR��jflv5�� f��,��<��C�>�{MVvDz��;X��ȼ�C"��]��^"WW�����Z�D'W��Z�wd����>�ͮx�
���G��,��*�e����g�*5zA+���q�u�� �f��Rh >���47r�+sSvJnF���%�Vc���)t:'�bޢg����h�{�i�<|6����F{��ۤ��GR~�������t�;ִ<�����ّH��4Ba6-��G�Y̬ؔ��6����������W��2�+ j@8!% �1���\^蒹�ߞ���n�a1i�� ��h�|9O�MsU�M'e%F�9lK+��)9�w5 �1��E�~�(��C�X�{|6g5�*��9$Q�ĺ���p�8����7A��D�z]׹�c��9�h�b�|��k����~�O@��{�
�LK��(��m��m���UZ$~�Q��U�Q7����vS�E����ڢ�!k���JL:Kt	��Z(���Q�dsRns5�<R�c�m	��;mo�c���EGjCr����_I�U��U��l���� ��4Z�
Q��Z4w�E*���tJ�J珔a�*�eM-s���׫�:�SO�|�vi]�1����mQ+5�@�^��&�d�m�m��y���)9��ʚJ�weM�^3mj~�|:H�|���Tla���:vZ8虒�EiO�GmX�|�68Ӈ6�o?�]���|�0v ٿ�:N�|�۱�e�4{A<����Bε��l��Ŵ��jV  m�b��h5>�+������^7�ҥ860[bE�dqf�0��V��-,�݀]�����JOaz�K�����-��Qn�yߘW�Si9��N���S~3zlj��h�����5��f�Ew�A����:��l�~�g?�s��6o��KuӇP����'$����A_��NSbp�1]#��Dv3#i�H9��?l�DR�m
{���h�H.�4;5����9:���Rf�c��9�9��E�I�5�Y
�bJ>�p|�U�Ku�ݵ�{+��x$�G�d�`���p�vܵ�'��5��V�AIj}s���2�Y�.��	s�K\�4��˅tޞ�D(/]\�5�u��6k ���P0�H)��l��͸O�Z2�b�|�-�
@$zi���ee���J+j����>�<!�󎉅d�;�z1U��YH�2��]�:'1���a�d���3.�R�7�R�v�1�0b�d{�s�u�Sڐ��&ii��k�k����r&+��E8������go���s
�il���R����W�������S�z��o�h�u�����}9'���D�ݐM���l��!:��*8�K�i���s'4E�#5��z��5+\Y�{�}�����|F�����_R�{fȳ�Ϊ]�?9�nH(���Y���e1��]#��ݓ���}�◍�9�Ҷ�,-Շ9$Os��\_]w�S�������ƣt'�����i�L�ݸ�2p���dCF_u�K�.�ཀྵP�n�X�G��;9fl7���(�]j�'�����lOy�
H�g"bhF�g��]8���},��)5t�;h�*OkyUR*=�%u�1w�M�W+$ͭ ;�Wout�g��#�8#�}�`���3�����ʳ�`��ĝs{��~9��K;�����n;Wp������|!Ӫ��I{D�.��ғ��k��͟�w?��e��T������������i���3�U��,t[�?�zL��ll��x�$q�yq����s�i2?�D���7�DD��&�e�&2�g�/$?7��}z�}dN�W}.}w�NV§����<<�"�q.$�Ş�V`�?����A�3���By�y���^t"�v�9����;l�����%�ߠ�-2����^wa�D ��<�ku��3���,�0�tפ{8�M�]92�F#	溪هT4�������0�r=���ri\"���^��j���.���L���!�Oi\��ûۉ,ga0w$�e7�t����������<4u�ڙ��C&���%�³$X�d=��)�D����^�4=��Hƅ����P\��/���	vvqD77;"��E��/�m�算̝���[���mLN?�I�~�f�|�}�|K�Mޮ��Vؔ��z͸U�`Χs��M��+��&�!�Wt(z�/�G/�J�E�s��77�L��O�:�ӞB�����;-֖��}�I�������u��H��k��烨˩T4D�������m�?����g��Q�>�i-�H(K�Y��Ų}��d�.��$q���L�3��A^��դ��]��8>�nG;��ky�&(���dz��1��Ǥ[]����n��X��i���g
�W:��&�p�f=�!�Ձ��^���n�0WѸp���^���3uM��M�t4�O\�������9L�o�!�U�W�藇�
�)��W���2��׶��+ҹə��u=�j�C8\iN3��^U�����M�w:?��	�M�M{�E��(�T��G�+�s���/]��櫜��d��1�Pt֥�>��\���c�/P�twW�jPu=A���m0�2M�m�՘��H\���85�z��R����!3
�S@�/ѯ998�o+3ۚO����8�<虘s9�A���3���0Duq)zs�����h�|t:k�_4�ĕIj��ipT��ؖB�M:��2qD}��Q3�ӏ�S�Y�9��5F��Fݎ�����Kݍ�NM'7�S�O�~��n7׹��7oP3����=��<��3P���4Q�ޓp����/������!��wP4�(����/7�Z㬁�ͫ����-�,0d?�U��@r������ �#���^M�C�<�SU�:�����a[���t�� �= _u�wޱ)��c9�E%>MwoԼh4��6�kbn�p��m�{�0|r~�Jv�O���>��[r����dVu����x�L�2o����qő���5�t��r��������V������;9&�Q��6� ;C�ma%ݺ��_MOogߠ��]�p�h2`��s���}%��R�¡󥭿1L7�z��)d���
5�@yH���D���n�j���7�!C5���W�۽��IL�B�[��F�V__��^�T�3(X7�"�H7dD^�KJ���ʏ�1C#�k7hWl_��;�>�6��5J)ٳ�񘯞�lY�
��G��敪B���[b�޺����Y]�.�3z]��?��E/��7�5ɵ�3����߁t���5�Pׅ#zե�֭'�E�UV\�u�rJ�06FsXG�Fϟ6�"��l�U�J>�Rz:��-}L� ATM��k�4Q61X�4�~T��SF�Q)�`8K�,$i$��n ���4q�-&P����q��|�g/'���ܠi$��V�n|RwC���3��A/T���v�j%
�PI:�R�9lX�����pt����0X�Dt�6�Ґ�90�vJz�f�xg`@�C��֥���q�Zwxd%,"��@A����NFG�������^Y����(�4�@asMi�����F��Bo���iY���o�1�}��f������.����'��م�)�`���ۓ��q�cL��i~��:a���+�� �n���N��e����9�@�%OIS	�ly����8�>�eR�!kn�o�3�3���N-`�F�>uk�%�msC�T�o��2m���䖄�aEEH�9o��N	 ��mB����d�7P�S�ֈĐ�ۢ���9�pbb�]bq�zҐ�����>Ql�B�,�p�'�ͮ��8������3q����M����28�ϯ,����v���m��F���޺j���VT/�^_5�+��֣�>nҪ����%m��yu�x�am/��K۷��]N'���Ul�f��g�l�o	�B]Y�AC�[�	T_��s<]���p�'9�i������T*��W�h�\h���9��� ��͕�3:�L��$�ݔ���c>���W���E{毝�(M9}%���M�2�X�U����u9�
M�G+'n�xz�v}�6�<]�Xׂ���0��u���X��]U����ȁ��mM�|,�Up�T�d���*n����i�W&�k��»�w9�' QD\(�1lzQ��ai��į�H��eh�@�0.� ��t��vp#�_i+�w��)T���|�H}9ƒ��k�	���C�wt�cc��5���������&�v1����1�)����¿�p-{�����*�啍�7O�8؁��nԿsrA9'�Lc�댙����k�Mϧ�mam�6e�oD$�ꬨ��R7�i@#n��&Nҳ���Sl���y+���L�`���F��r�Ru��I�P�
��S�A[�	���pG�����hDi�^-5u�x�A�{{n�G����ԻB�Y����#GŷT$kP�n�{u�.Z��LA{m�O��c KW	Ig��%�͆M}�i�vw4�ה�h�c5T#Y�c�!�ʓ�5��w[��,�_r�:�XZ��Ea���g���4��Pl���z�*�$�}��sN�����@ֶ�G�^T�?t\Ґ�ߤfm�X�m���t5�x���b�@]��k]D�l,!�6��~-��%�t�j�����Zr�Hh��C�o�|�P���?f���H�j|26D5W"����xk�$>p F����8��|�z��澅#5��j��J��ZG��p#d�z�=��(�U��Gn�� zn��O']��q
����R�?N�������۬��B�j��X�x
C�jT�l�pf������R�j���1����*�����v�e��e���ГV��|:"3#3��d���pCG�#�����eL�-�	�� WLp�E:�i#��m�͎R����~���b���-�ּ�Q�cS\1m�@���L��X-��t���5?j�xz�14��&"�k6�g��z���a�� �������8�@����o��D;伥���Ac3?? ��������ȕOߐ`S�*�A���B-܁�����h�(F%|C��?x��*4���b�R5��es�_���i�{.�A�,q�'��j� ��>�9y�[���? �����Go R���\�{��y?�W´�*!>
������r!�7��Fa�X�G�Å %6��F�-]&9� �_
A�*�CS��@���T�+���R3t@��PS��4 ?��p�� %4��S�j���'9�g�����ة�l:@+��\���\ _VNanFZ:����..���6��I�2q�7��+��@8�M�ͣ�pJY	W�=^QM�"�P� �6�}��3A��LR&TN
���s��7l ��
��������[�[��ܿ�yF{e�����ښ��������}�f=�"�{�����E��_�&��$��! Pl(�tX�����{M�ۦxGy��E���A��I�W��W����?[O��<w4�����U%nM���	�ls8_ݑ���[�bsW�~��c�jC%���Yh�B�m
귑rPT�+pE�"S]��Q<��ݸ!PtT�`HQ�:.��[-sW\&XAz�̗s�_�E�y�\�r�ۚ8��E��Q����C�`�ޢ���AHF�ȋ�*
�~YV�/�ה�qa�L�!��x(a�s!�C�����B�����CÍ��
�T^�T@�<R�h��o���x�(�C��<!�	(0<㹀�zBo��6D0*���L)�S� ��b�<��Q��i��*��	*}�3�r�)9wB�[Y��?k"4B�tYq>��$����, ��
[
� ���
��2�8#_�\-�B�(��[���h����Q��+9�-�d �E�^���eJ����=E�uJ_)�
�g�$��<�D|Gd�P�)����$�r�,S7%���E.#\�`J�AV��_??�<K_(��T�=x\��� �H2�&���)�"�j�1�-����ڗs%V	���{2�tq�)"/'?�{cy�Y�E��B*o�Y&��X�9�2�3P���*Ɔ(?뀷�q!YG�` ��)R$$���
��U ?C�x�
R��
pQ�Ly,E��I��,[aD���T��ү�;���sq����c���2���<��� �V@���9w6T���ar�oXO!�B�Y�U���YA�h�`I���+�<��Q0�qE����n���4P��*W�-[�`�(�ep���+{��FW��LE5��>}W2ļIT ıQ��E[�c=�o��F��*?K�/$�������*&	��x����^ȟ$��<�*����9:<W(爷�x�7��� ��x+��A����=n���_O�U1���@����\  