import express from 'express'
import morgan from 'morgan'
import ManutencaoMiddleware from './middlewares/manutencaoMiddleware.js'
import db from '../database/db.js'

const app = express()
const PORT = 3000
const estaDisponivel = true
const manutencaoMiddleware = new ManutencaoMiddleware(estaDisponivel)

app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(morgan(':method :url :status :res[content-length] - :response-time ms'))
app.use((req, res, next) => manutencaoMiddleware.verificandoDisponibilidade(req, res, next))

await db.connect()

app.get('/', (req, res) => {
    res.status(200).json({message: 'API funcionando!'})
})

app.get('/usuarios', async (req, res) => {
    try {
        const {rows} = await db.query('SELECT * FROM `Users`')
        res.status(200).json({message: 'Resultado encontrado!', usuarios: rows})
    } catch(error) {
        console.error('Error ao buscar usuários:', error)
        res.status(500).json({error: 'Erro ao buscar usuários'})
    }
})

app.listen(PORT, () => console.log(`API, rodando em http://localhost:${PORT}`))
