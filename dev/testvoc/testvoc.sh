echo "==Aragonese->Catalan==========================";
bash inconsistency.sh arg-cat ../../../apertium-arg/apertium-arg.arg.dix > arg-cat.testvoc; bash inconsistency-summary.sh arg-cat.testvoc arg-cat 
echo ""
echo "==Catalan->Aragonese===========================";
bash inconsistency.sh cat-arg ../../../apertium-cat/apertium-cat.cat.metadix > cat-arg.testvoc; bash inconsistency-summary.sh cat-arg.testvoc cat-arg
