o '解压tar包...'
tar_file=$1
if [ -f $tar_file ];then
  tar -zxvf $tar_file

  echo '将docker目录移到/usr/bin目录下...'
  cp docker/* /usr/bin/

  echo '将docker.service 移到/etc/systemd/system/ 目录...'
  cp docker.service /etc/systemd/system/

  echo '添加文件权限...'
  chmod +x /etc/systemd/system/docker.service

  echo '重新加载配置文件...'
  systemctl daemon-reload

  echo '启动docker...'
  systemctl start docker

  echo '设置开机自启...'
  systemctl enable docker.service

  echo 'docker安装成功...'
  docker -v
else
  echo "$tar_file,文件不存在"
fi

