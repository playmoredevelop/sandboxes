/* eslint-disable require-jsdoc */
const fetch = require('simple-fetch')

const start = new Date().getTime()

async function getBlockCommission(index) {

    const block = await fetch.getJson('https://teznode.letzbake.com/chains/main/blocks/' + index)
    const results = { count: 0, fee: 0 }

    block && block.operations.map(op => op.map(transaction => {

        transaction.contents && transaction.contents.map(content => {
            content.fee && (results.fee += parseFloat(content.fee))
        }) && results.count ++
    }))

    return results
}

(async () => {
    const results = await Promise.all([832543, 832544, 832545].map(getBlockCommission))
    const total = results.reduce((a, c) => { return { count: a.count + c.count, fee: a.fee + c.fee } })
    console.log('Count transactions', total.count)
    console.log('Bakers fees', total.fee)
    console.log('Memory (heapUsed, MB)', Math.round(process.memoryUsage().heapUsed / 1024 / 1024 * 100) / 100)
    console.log('Time (seconds)', (new Date().getTime() - start) / 1000)
})()
