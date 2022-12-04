/**
 * 
 */
window.onload = () => {
	var desc = document.querySelector('#desc');
	var open = document.querySelector('#open');
	var close = document.querySelector('#close');

	open.onclick = () => {
		desc.style.display = "block"; // 상세 설명 부분을 화면에 표시
		open.style.display = "none"; // '상세 설명 보기' 단추를 화면에서 감춤
	};

	close.onclick = () => {
		desc.style.display = "none"; // 상세 설명 부분을 화면에서 감춤
		open.style.display = "block"; // '상세 설명 보기' 단추를 화면에 표시
	};
}