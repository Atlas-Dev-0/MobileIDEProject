echo "___  _________ _____" 
echo "|  \/  || ___ \  __ \/"
echo "| .  . || |_/ / |  \/"
echo "| |\/| ||    /| | __ "
echo "| |  | || |\ \| |_\ \/"
echo "\_|  |_/\_| \_|\____/"
echo ""
echo "MobileIDEProject"
echo ""
 
# Function to check the exit status of a command
check_command() {
	"$@"
	status=$?
	if [ $status -ne 0 ]; then
        echo "Error with $1" >&2
        exit $status
    fi
}

# Install the apt package
echo "Installing APT package manager.."
check_command pkg install apt -y
check_command apt update -y
check_command apt upgrade -y

#install neovim
echo "Installing Neovim..."
check_command apt install neovim -y
echo "Neovim is installed..."

#installation of c compilers
echo "Installing essential build tools (c compilers) "
check_command apt install build-essential -y

#python installation
echo "Installing python3"
check_command apt install python3 -y

#nodejs installation
echo "Installing nodejs"
check_command apt install nodejs -y
echo "node js installed"

#configuration of neovim
echo "configuring neovim..."
check_command apt install stylua
check_command apt install clang
check_command apt install ripgrep

cd ~
cd ~/.config/
# Remove existing nvim directory if it exists
if [ -d "nvim" ]; then
    echo "Removing existing nvim directory..."
    rm -rf nvim
fi

check_command git clone --branch MobileIDEProject https://github.com/atlas-dev-0/nvdf.git nvim 

#install wget
check_command apt install wget -y

#install tmux
check_command apt install tmux -y
check_command cp ~/.config/nvim/tmuxConfiguration/.tmux.conf ~/
echo "added tmux configuration"

#install zsh
check_command rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
check_command apt install zsh -y
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

#make zsh default
check_command chsh -s zsh 

#open tmux
check_command tmux 

#end
echo "Neovim Configured...You may open it now using 'nvim' command"


