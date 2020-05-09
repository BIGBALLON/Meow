# Linux Tools

- Reference: [ubuntu_rc](https://github.com/BIGBALLON/ubuntu_rc)


## Miniconda Installation

```bash
cd ~/Downloads

# install latest miniconda
# see https://docs.conda.io/en/latest/miniconda.html
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
eval "$(~/miniconda/bin/conda shell.bash hook)" 
conda init
```

## Zsh Installation

```bash
# install zsh
# see http://www.zsh.org/
sudo apt install zsh -y
# install oh-my-zsh
# see https://ohmyz.sh/
cd ~
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh)"
# install plugin for omzsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/(git)/(git extract z zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
```

## tmux Installation

```bash
# install tmux
sudo apt install zsh -y
# install oh-my-tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

## vimrc Installation

```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```