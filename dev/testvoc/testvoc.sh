echo "==Aragonese->Catalan==========================";
bash inconsistency.sh arg-cat ../../../../languages/apertium-arg/apertium-arg.arg.dix > /tmp/arg-cat.testvoc; bash inconsistency-summary.sh /tmp/arg-cat.testvoc arg-cat 
echo ""
echo "==Catalan->Aragonese===========================";
bash inconsistency.sh cat-arg ../../../../languages/apertium-cat/apertium-cat.cat.dix > /tmp/cat-arg.testvoc; bash inconsistency-summary.sh /tmp/cat-arg.testvoc cat-arg
