const { Pool } = require("pg");

const pool = new Pool({
  host: "localhost",
  user: "marko",
  port: 5432,
  database: "library",
  password: "Pa$$w0rd",
  
});

module.exports = pool;
