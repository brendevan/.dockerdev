# ===========================================
#                  SYSTEM
# ===========================================

## Get R version 4.3.2 in ubuntu linux
FROM rocker/r-ver:4.3.2

# Install required programs
RUN apt-get update && apt-get install -y --no-install-recommends \
  # libharfbuzz-dev \
  # libfribidi-dev \
  # libfreetype6-dev \
  # libpng-dev \
  # libtiff5-dev \
  # libjpeg-dev \
  # libgdal-dev \
  curl \
  docker \
  git \
  nano \
  pandoc \         
  python3-pip \
  zsh

# Copy across scripts needed to setup dockerdev
RUN mkdir ~/.dockerdev
COPY /scripts ~/.dockerdev/scripts

# ===========================================
#                    ZSH
# ===========================================

# Make ZSH the default shell
RUN chsh -s $(which zsh)

# Install oh-my-zsh and set as default (yes answers 'y' to all prompts)
RUN sh -c "$(yes | curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins for oh-my-zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# ===========================================
#             DOTFILES & ALIASES
# ===========================================
RUN git clone https://github.com/brendevan/.dotfiles ~/.dotfiles
RUN bash ~/.dotfiles/scripts/link_dotfiles.sh
RUN bash ~/.dotfiles/scripts/aliases.sh

# ===========================================
#                    R
# ===========================================

# Install radian R console
RUN pip3 install -U radian

# Install R packages
# RUN Rscript /~/docker-dev/scripts/R/install_packages.R