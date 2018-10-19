#!/usr/bin/env bash
:<<describle
  desc: 项目启动脚本
  author: Answer.Ai.L
  datetime: 2018-10-18 10:32:42
describle

UP_DOWN="$1"
CONTAINER_WEB="springboot.mybatis.web"
CONTAINER_MYSQL="springboot.mybatis.mysql"

# 判断是否存在环境变量文件， 存在则读取
if [ -e "./.env" ]; then
  source ./.env
fi

# 日志存放路径
logPath="./logs/"
logFileName="smw.log"

persistentDir="./data/"

# 判断文件夹是否存在, 不存在则新建
if [ ! -d ${logPath} ]; then
  mkdir ${logPath}
fi

if [ ! -d ${persistentDir} ]; then
  mkdir ${persistentDir}
fi

# ------------------------- 日志操作方法 Start -------------------------
function logger() {
  echo $(date +%F%n%T)" [$1] $2" | tee -a "${logPath}${logFileName}"
}

function debug() {
  # 只有环境变量 DT_DEBUG 定义了并且为true或者"true"才打印debug日志
  if [ ${DT_DEBUG} -a ${DT_DEBUG} = "true" ]; then
    logger "DEBUG" "$1"
  fi
}

function info() {
  logger "INFO" "$1"
}

function warn() {
  logger "WARN" "$1"
}

function error() {
  logger "ERROR" "$1"
}
# ------------------------- 日志操作方法 End -------------------------

function startService () {
  info "ready to start service."

  # 判断是否已实例化过容器
  local containerCnt=`docker ps | grep -E "${CONTAINER_WEB}|${CONTAINER_MYSQL}" | wc  -l`
  if [ ${containerCnt} -gt 0 ]; then
    info "容器已被实例化, 是否需要重启?重启/退出[y/n]"

    read userInput
    info "user input for whether to restart: ${userInput}."
    if [ ${userInput} ] && [ ${userInput} == "Y" -o ${userInput} == "y" -o ${userInput} == "YES" -o ${userInput} == "yes" ]; then
      downService  
    else 
      info "程序退出!!!"
      exit 1
    fi
  fi
 
  local dirCnt=`ls ${persistentDir} | wc -l`
  if [ ${dirCnt} -gt 0 ]; then
    info "持久化目录[${persistentDir}]下已有文件信息, 是否需要移除?移除/备份[y/n]"   
     
    read bakInput
    info "user input for whether to backup: ${bakInput}."
    if [ ${bakInput} ] && [ ${bakInput} == "Y" -o ${bakInput} == "y" -o ${bakInput} == "YES" -o ${bakInput} == "yes" ]; then
      warn "持久化目录[${persistentDir}]下的文件已被移除"
      rm -rf ${persistentDir}*
    else 
      local bakDir="./dataBak/$(date +%Y%m%d%H%M%S)/"
      if [ ! -d "${bakDir}" ]; then
        mkdir -p ${bakDir}
      fi
      mv ${persistentDir}* ${bakDir}
      if [ $? -eq 1 ]; then
        error "备份持久化目录异常, 程序终止."
        exit 1;
      fi
    fi 
  fi

  WEB_CONTAINER_NAME=${WEB_CONTAINER_NAME} \
  MYSQL_CONTAINER_NAME=${MYSQL_CONTAINER_NAME} \
  WEB_IMAGE_VERSION=${WEB_IMAGE_VERSION} \
  MYSQL_IMAGE_VERSION=${MYSQL_IMAGE_VERSION} \
  WEB_PORT=${WEB_PORT} \
  MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
  MYSQL_IP=${MYSQL_IP} \
  MYSQL_PORT=${MYSQL_PORT} \
  MYSQL_DB=${MYSQL_DB} \
  MYSQL_UNAME=${MYSQL_UNAME} \
  MYSQL_PASSWD=${MYSQL_PASSWD} \
  docker-compose -f ./docker-compose.yaml up -d
  
  info "start service successful!"
}


function downService () {
  info "ready to down service."

  docker ps | grep -q ${CONTAINER_WEB}
  if [ $? -eq 0 ]; then
    docker rm -f ${CONTAINER_WEB}
    info "force rm container ${CONTAINER_WEB}[0:success | 1:failed]: $?."
  fi
  docker ps | grep -q ${CONTAINER_MYSQL}
  if [ $? -eq 0 ]; then
    docker rm -f ${CONTAINER_MYSQL}
    info "force rm container ${CONTAINER_MYSQL}[0:success | 1:failed]: $?."
  fi
 
  info "down service successful!"
}


function restartService () {
  info "ready to restart service."

  downService

  startService 

  info "restart service successful!"
}


function printHelp () {
  echo "Usage:"
  echo -e "\tbash start.sh up | down | restart"
  exit 1
}



if [ "${UP_DOWN}" == 'up' ]; then
  startService
elif [ "${UP_DOWN}" == 'down' ]; then
  downService
elif [ "${UP_DOWN}" == 'restart' ]; then
  restartService
else
  printHelp
  exit 1
fi

exit 0
