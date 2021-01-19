const ROOT_PATH = 'http://localhost/tynkle';

const getPlatforms = async (data) => {
    const options = {
        headers: {
            'Content-Type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify(data)
    }
    return fetch(ROOT_PATH + '/breakdowns', options).then((results) => results.json()).catch((error) => console.log(error))
}

export { getPlatforms }
