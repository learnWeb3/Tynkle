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

const signout = async () => {
    const options = {
        headers: {
            'Content-Type': 'application/json'
        },
        method: 'DELETE',
    }
    return fetch(ROOT_PATH + '/logout', options).then((response) => {
        return {status : response.status};
    }).catch((error) => console.log(error))
}

const getFollowingPosts = (nextPage) =>{
    const options = {
        headers: {
            'Content-Type': 'application/json'
        },
        method: 'GET',
    }
    return fetch(ROOT_PATH  + nextPage + '&ajax=true', options);
}
export { getPlatforms, signout, getFollowingPosts, ROOT_PATH }
