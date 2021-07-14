NVIM_DIR   = "$(home)/.config/nvim"
PICOM_DIR  = "$(home)/.config/picom"
TMUX_DIR   = "$(home)/.tmux.conf"
XMONAD_DIR = "$(home)/.xmonad"
XMOBAR_DIR = "$(home)/.config/xmobar"
ZSHRC_DIR  = "$(home)/.zshrc"


STABLE_CMD = "install remove"

all:
	@printf "Available commands:\n";\
	for cmd in $(STABLE_CMD); do\
		printf "\t$${cmd}\n";\
	done;


install: get_vars;

uninstall: get_vars;
	rm -f $(NVIM_DIR) $(PICOM_DIR) $(XMONAD_DIR) $(XMOBAR_DIR) $(ZSHRC_DIR)

get_vars:
	@user="`who | awk 'NR==1{print $$1}'`";\
	while [ "$${choose}" != 'Y' -a "$${choose}" != 'N' ]; do\
		printf "Is $${user} your user? [y/n] ";\
		read choose;\
		choose="`printf \"$${choose}\" | tr '[:lower:]' '[:upper:]'`";\
	done;\
	if [ "$${choose}" == 'N' ]; then\
		user=;\
		while ! id "$${user}" &>/dev/null; do\
			printf "What is the user? ";\
			read user;\
		done;\
	fi;\
	home="`su - $${user} -c 'printf $${HOME}'`";\
	choose=;\
	while [ "$${choose}" != 'Y' -a "$${choose}" != 'N' ]; do\
		printf "Is $${home} the user home? [y/n] ";\
		read choose;\
		choose="`printf \"$${choose}\" | tr '[:lower:]' '[:upper:]'`";\
	done;\
	if [ "$${choose}" == 'N' ]; then\
		home=;\
		while [ ! -d "$${home}" ]; do\
			printf "What is the user home? ";\
			read home;\
		done;\
	fi;\
	make pos_vars -e "user=$${user}" "home=$${home}" -B;

pos_vars: nvim picom st xmonad xmobar zshrc;

nvim:
	[ ! -d "$(NVIM_DIR)" -a ! -f "$(NVIM_DIR)" ] &&\
	ln -s "`pwd`/nvim" "$(NVIM_DIR)";

picom:
	[ ! -d "$(PICOM_DIR)" -a ! -f "$(PICOM_DIR)" ] &&\
	ln -s "`pwd`/picom" "$(PICOM_DIR)";

st:
	cd ./st;\
	make &&\
	make install &&\
	make clean;\
	cd ..;\
	git restore ./st/config.h;

tmux:
	[ ! -d "$(home)/.tmux/plugins/tpm" -a ! -f "$(home)/.tmux/plugins/tpm" ] &&\
	git clone https://github.com/tmux-plugins/tpm $(home)/.tmux/plugins/tpm;\
	[ ! -d "$(TMUX_DIR)" -a ! -f "$(TMUX_DIR)" ] &&\
	ln -s "`pwd`/tmux/tmux.conf" "$(TMUX_DIR)";

xmonad:
	[ ! -d "$(XMONAD_DIR)" -a ! -f "$(XMONAD_DIR)" ] &&\
	ln -s "`pwd`/xmonad" "$(XMONAD_DIR)";

xmobar:
	[ ! -d "$(XMOBAR_DIR)" -a ! -f "$(XMOBAR_DIR)" ] &&\
	ln -s "`pwd`/xmobar" "$(XMOBAR_DIR)";

zshrc:
	[ -d "$(ZSHRC_DIR)" -o -f "$(ZSHRC_DIR)" ] &&\
	mv "$(ZSHRC_DIR)" "$(ZSHRC_DIR).bkp";\
	su - $${user} -c 'sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"';\
	[ -d "$(ZSHRC_DIR)" -o -f "$(ZSHRC_DIR)" ] &&\
	rm -Rf "$(ZSHRC_DIR)";\
	ln -s "`pwd`/zshrc/zshrc" "$(ZSHRC_DIR)";
