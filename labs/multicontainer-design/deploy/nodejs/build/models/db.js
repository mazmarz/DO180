
module.exports.params = {
  dbname: process.env.MYSQL_DATABASE,
  username: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  params: {
      host: 'mysql',
      port: '3306',
      dialect: 'mysql'
  }
};
