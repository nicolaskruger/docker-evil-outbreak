import mysql from "mysql2/promise";
import * as fs from "fs";

const run = async () => {
  const link = () =>
    mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "xxxxxxxxxxxxxxxx",
      database: "mysql",
      port: 3306,
      multipleStatements: true,
    });
  const sql = () => fs.readFileSync("script/bioserver.sql").toString();
  await link().then((conn) => conn.query(sql()).then(() => conn.end()));
};

run()
  .then(() => {
    console.log("Database initialized successfully.");
  })
  .catch((err) => {
    console.error("Error initializing database:", err);
  });
