
echo "___  _________ _____" 
echo "|  \/  || ___ \  __ \/"
echo "| .  . || |_/ / |  \/"
echo "| |\/| ||    /| | __ "
echo "| |  | || |\ \| |_\ \/"
echo "\_|  |_/\_| \_|\____/"
echo ""
echo "MobileIDEProject"
echo ""
echo ""
echo "Installing APT package manager.."
 
# Function to check the exit status of a command
check_command() {
	"$@"
	status=$?
	if [ $status -ne 0 ]; then
        echo "Error with $1" >&2
        exit $status
    fi
}

# Install the pkg package
check_command pkg install apt -y

# Update the package list
check_command apt update -y

# Upgrade all packages
check_command apt upgrade -y

echo "Apt installed and is updated "
echo ""
echo "Installing Neovim..."
echo ""
check_command apt install neovim -y

echo "Neovim is installed..."
echo ""
echo ""
echo "Installing essential build tools (c compilers) "
check_command apt install build-essential -y
echo ""
echo ""
echo "Installing python3"
echo ""
check_command apt install python3 -y
echo ""
echo ""
echo ""
echo "Configuring Neovim..."
cd ~
cd ~/.config/
check_command git clone --branch MobileIDEProject https://github.com/Atlas-Dev-0/NVDF.git nvim 

echo "Neovim Configured...You may open it now"


