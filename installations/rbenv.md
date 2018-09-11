Установка ruby используя Rbenv
===

_Для Unix-подобных систем_ 

**Rbenv** простое и удобное решение, позволяющее управлять версиями ruby в проектах.

## Порядок установки
1. Скопировать `rbenv` в ~/.rbenv

   ```
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   ```
   
2. Для доступа к команде `rbenv` необходимо добавить `~/.rbenv/bin` в `$PATH`.
   
   Bash:
   ```
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
   ```
   Ubuntu:
   ```
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   ```
   
**Ресурс:** https://github.com/rbenv/rbenv#basic-github-checkout
