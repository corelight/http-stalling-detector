# @TEST-EXEC: bro -r $TRACES/slowloris_scan.pcap ../../../scripts %INPUT
# @TEST-EXEC: btest-diff notice.log
