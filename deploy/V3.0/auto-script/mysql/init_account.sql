/** 创建 docker 账户 */
use mysql;

create user 'docker'@'%' identified by '123456';

grant all privileges on answer.* to 'docker'@'%';

flush privileges;
