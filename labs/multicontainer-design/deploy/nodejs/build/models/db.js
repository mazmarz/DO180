
module.exports.params = {
  dbname: process.env.MYSQL_DATABASE,
  username: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  params: {
      host: process.env.MYSQL_PORT_3306_TCP_ADDR,
      port: process.env.MYSQL_PORT_3306_TCP_PORT,
      dialect: 'mysql'
  }
};
