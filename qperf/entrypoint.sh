#!/bin/sh

iteration=1
t=10

echo "Running as ${SERVICE_TYPE}"
echo "SERVER_ADDR ${SERVER_ADDR}"


if [ ${SERVICE_TYPE} == "server" ] ; then
  qperf && iperf3 -s
elif [ ${SERVICE_TYPE} == "qperf" ] ; then
  while true ; do
    sleep 1
    t=$(shuf -i ${PERF_INTERVAL} -n 1)
      lat=$(qperf -t ${t} --use_bits_per_sec ${SERVER_ADDR} tcp_lat | grep "latency")
    echo "iteration:${iteration}  t:${t} ${lat}"
    let iteration++
  done
elif [ ${SERVICE_TYPE} == "iperf" ] ; then
  while true ; do
    sleep 1
    t=$(shuf -i ${PERF_INTERVAL} -n 1)
      iperf3 -t ${t} -i 1 -c ${SERVER_ADDR}
    let iteration++
  done
elif [ ${SERVICE_TYPE} == "ping" ] ; then
  sleep 1
  ping -i 5 ${SERVER_ADDR} | awk  -F'='  '{print$4}'
fi
