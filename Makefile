NVIM_DIR = "$(home)/.config/nvim"
PICOM_DIR = "$(home)/.config/picom"
XMONAD_DIR = "$(home)/.xmonad"
XMOBAR_DIR = "$(home)/.config/xmobar"

STABLE_CMD = "install"

all:
	@printf "Available commands:\n";\
	for cmd in $(STABLE_CMD); do\
		printf "\t$${cmd}\n";\
	done;


install: get_vars;

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

pos_vars: nvim picom st xmonad xmobar;

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

xmonad:
	[ ! -d "$(XMONAD_DIR)" -a ! -f "$(XMONAD_DIR)" ] &&\
	ln -s "`pwd`/xmonad" "$(XMONAD_DIR)";

xmobar:
	[ ! -d "$(XMOBAR_DIR)" -a ! -f "$(XMOBAR_DIR)" ] &&\
	ln -s "`pwd`/xmobar" "$(XMOBAR_DIR)";
