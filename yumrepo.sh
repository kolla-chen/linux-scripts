cat > /tmp/yumrepo.sh << 'EOF'
# 创建备份路径
mkdir -p /etc/yum.repos.d/repo.bak/
# 备份源
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/repo.bak/
# 导入镜像内容到yum文件中
cat > /etc/yum.repos.d/centos-tuna.repo << 'EOO'
#CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-\$releasever - Base
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/os/\$basearch/
enabled=1
gpgcheck=0

#released updates
[updates]
name=CentOS-\$releasever - Updates
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/updates/\$basearch/
#baseurl=https://mirrors.aliyun.com/centos/\$releasever/updates/\$basearch/
#mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=updates
enabled=1
gpgcheck=0

#additional packages that may be useful

[centosplus]
name=CentOS-\$releasever - Plus
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/centosplus/\$basearch/
#baseurl=https://mirrors.aliyun.com/centos/\$releasever/centosplus/\$basearch/
#mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=centosplus
enabled=1
gpgcheck=0

[cloud]
name=CentOS-\$releasever - Cloud
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/cloud/\$basearch/openstack-train/
#baseurl=https://mirrors.aliyun.com/centos/\$releasever/cloud/\$basearch/openstack-train/
enabled=1
gpgcheck=0

[paas]
name=CentOS-\$releasever - paas
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/paas/\$basearch/openshift-origin13/
#baseurl=https://mirrors.aliyun.com/centos/\$releasever/paas/\$basearch/openshift-origin13/
enabled=1
gpgcheck=0

[kvm]
name=CentOS-\$releasever - kvm
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/virt/\$basearch/kvm-common/
#baseurl=https://mirrors.aliyun.com/centos/\$releasever/virt/\$basearch/kvm-common/
enabled=1
gpgcheck=0

[extras]
name=CentOS-\$releasever - extras
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/extras/\$basearch/
#baseurl=https://mirrors.aliyun.com/centos/\$releasever/extras/\$basearch/
enabled=1
gpgcheck=0

[epel]
name=Extra Packages for Enterprise Linux 7 - $basearch
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/$basearch
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=0

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 7 - $basearch - Debug
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/$basearch/debug
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=0

[epel-source]
name=Extra Packages for Enterprise Linux 7 - $basearch - Source
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/SRPMS
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=0

EOO
#清除yum缓存
yum clean all
#重新做yum 缓存
yum makecache
EOF
# 执行该脚本
bash /tmp/yumrepo.sh