class ConfigDb {
        constructor(host, user, password, database){
            this.host = host
            this.user = user,
            this.password = password,
            this.database = database
        }
}

const mysqlConfig = new ConfigDb('localhost', 'root', 'root', 'blog_site')

export default mysqlConfig