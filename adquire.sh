#/bin/bash 
#------------------------------------------------------------------------
#
#
#  SCRIPT PARA ADQUIRIR PREVISOES DO ETA 10 DIAS DO CPTEC E 
#  CALCULAR CHUVA ACUMULADA POR BACIA DO SIN 
#
#  VERSAO 2.0 
#
#
#  bY regis  reginaldo.venturadesa@gmail.com 
#  uso:
#      adquire  [00/12]
#    
# ----------------------------------------------------------------------
# Necessita de um arquivo contendo informaçoes sonre as bacias. 
#  (ver como documentar isso aqui)
#
#
#
#------------------------------------------------------------------------- 
# essa versao é feita pela conta regisgrundig e nao pela lAMOC
#
#--------------------------------------------------------------------------



export LANG=en_us_8859_1





MACH=`uname -a | cut -c1-5` 
if [ $MACH = "Linux" ];then 
export PATH=$PATH:/usr/local/grads
export GADDIR=/usr/local/grads
export GADLIB=/usr/local/grads
export GASCRP=/usr/local/grads
fi 

 #%
#% maquina da UFF 
#%
MACH=`uname -a | cut -c7-11` 
if [ $MACH = "DEAMA" ];then 
export PATH=/home/cataldi/SCRIPT/grads:$PATH
export GADDIR=/home/cataldi/SCRIPT/grads
export GADLIB=/home/cataldi/SCRIPT/rads
export GASCRP=/home/cataldi/SCRIPT/grads
fi 


MACH=`hostname` 
if [ $MACH = "clsrv1" ];then 
echo "             hostname clsrv1 "
cd /home/anderson/Downloads/CMB-master
export PATH=$PATH:/usr/local/grads
export GADDIR=/usr/local/grads
export GADLIB=/usr/local/grads
export GASCRP=/usr/local/grads

fi 


./adquire_eta40.sh $1
./adquire_obs.sh $1
./adquire_gfs.sh  $1
./adquire_cfs.sh  $1






