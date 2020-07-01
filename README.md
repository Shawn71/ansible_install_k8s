# Kubernetes v1.18 高可用集群自动部署（离线版）
>### 确保所有节点系统时间一致
### 1、下载软件包并解压到/root目录

云盘地址：链接：https://pan.baidu.com/s/1PiZ2vZ2xeMPC8fDbEv327Q  提取码：nvk8 
```
# tar -xf binary_pkg.tar.gz -C /root/
```

### 2、下载Ansible部署文件

```
# git clone https://github.com/ShawnBian/ansible-install-k8s
# cd ansible-install-k8s
```

### 3、修改Ansible文件

修改hosts文件，根据规划修改对应IP和名称。

```
# vi hosts
...
```
修改group_vars/all.yml文件，修改文件位置以及证书的SAN信息。

```
# vim group_vars/all.yml
software_dir: '/root/binary_pkg'
...
cert_hosts:
  k8s:
  etcd:
```
## 4、一键部署
### 架构图
多Master架构
![avatar](https://github.com/ShawnBian/ansible-install-k8s/blob/master/multi-master.jpg)
### 部署命令

ansible-playbook -i hosts site.yml

## 5、部署控制
如果安装某个阶段失败，可针对性测试.

例如：只运行部署插件
```
ansible-playbook -i hosts site.yml --tags addons
```
