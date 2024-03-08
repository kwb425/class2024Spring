// 이벤트 리스너 설정
document.getElementById('fetchData').addEventListener('click', function() {
    var clientId = '67e6a2bc931d43b3a3464a06529fb351';
    var clientSecret = '7b50cf8d7f3b43e9811580324714c194';

    // 토큰을 가져오는 함수
    function getToken() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "https://accounts.spotify.com/api/token", false); // 비동기 파라미터를 false
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.setRequestHeader("Authorization", "Basic " + btoa(clientId + ":" + clientSecret));

        xhr.send("grant_type=client_credentials");

        if (xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            return response.access_token;
        } else {
            return null; // 오류 처리
        }
    }

    // 아티스트의 앨범을 가져오는 함수
    function getAlbums(token) {
        var artistId = '4gzpq5DPGxSnKTe4SA8HAU';
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "https://api.spotify.com/v1/artists/" + artistId + "/albums", false);
        xhr.setRequestHeader("Authorization", "Bearer " + token);

        xhr.send();

        if (xhr.status === 200) {
            return JSON.parse(xhr.responseText).items;
        } else {
            return []; // 오류 처리
        }
    }

    // 앨범 정보를 화면에 보여주는 함수
    function displayAlbums(albums) {
        var albumsList = document.getElementById('albumsList');
        albumsList.innerHTML = '';
        albums.forEach(function(album) {
            var listItem = document.createElement('li');
            listItem.textContent = album.name;
            albumsList.appendChild(listItem);
        });
    }

    // 실행 로직
    var token = getToken();
    if (token) {
        var albums = getAlbums(token);
        displayAlbums(albums);
    } else {
        console.error('Failed to retrieve token');
    }
});
