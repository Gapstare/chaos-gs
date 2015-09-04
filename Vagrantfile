Vagrant.configure(2) do |config|
  config.vm.box = 'puphpet/debian75-x32'

  config.vm.provision 'shell', inline: <<-SHELL
    set -e
    sudo apt-get update
    sudo apt-get install -y \
      astyle \
      cmake \
      dosfstools \
      gcc-multilib \
      gdb \
      genisoimage \
      git \
      grub-legacy \
      mtools \
      nasm \
      qemu \
      rake

    cd /vagrant
    ./install_cmocka.sh

    echo 'drive u: file="/vagrant/servers/block/initial_ramdisk/ramdisk.image"' > /etc/mtools.conf
    echo 'cd /vagrant' >> /home/vagrant/.bashrc
    echo '-U' > /home/vagrant/.astylerc
    echo '-H' >> /home/vagrant/.astylerc
    echo '-S' >> /home/vagrant/.astylerc

    echo target remote localhost:1234 > /home/vagrant/.gdbinit
  SHELL
end
