//PRs welcome!
function _1(e){let t=JSON.parse(localStorage.getItem("s"))||[];t.includes(e)||(t.unshift(e),t.length>5&&t.pop(),localStorage.setItem("s",JSON.stringify(t)))}function _2(e){let t=JSON.parse(localStorage.getItem("f"))||[];t.includes(e)||(t.push(e),t.sort(),localStorage.setItem("f",JSON.stringify(t))),_5()}function _3(e){let t=JSON.parse(localStorage.getItem("f"))||[];t=t.filter((t=>t!==e)),t.sort(),localStorage.setItem("f",JSON.stringify(t)),_5()}function _4(){const e=document.querySelector("#SIC");if(!e)return;e.innerHTML="",(JSON.parse(localStorage.getItem("s"))||[]).forEach((t=>{const n=document.createElement("div");n.textContent=t,n.classList.add("stored-item"),n.style.cursor="pointer";const o=document.createElement("span");o.textContent=" +",o.style.color="blue",o.style.cursor="pointer",o.title="Add to Favorites",o.addEventListener("click",(()=>_2(t))),n.addEventListener("click",(()=>{document.querySelector('input[name="wish"]').value=t})),n.appendChild(o),e.appendChild(n)}))}function _5(){const e=document.querySelector("#FIC");if(!e)return;e.innerHTML="",(JSON.parse(localStorage.getItem("f"))||[]).forEach((t=>{const n=document.createElement("div");n.textContent=t,n.classList.add("favorite-item"),n.style.cursor="pointer";const o=document.createElement("span");o.textContent="- ",o.style.color="blue",o.style.cursor="pointer",o.title="Remove from Favorites",o.addEventListener("click",(()=>_3(t))),n.addEventListener("click",(()=>{document.querySelector('input[name="wish"]').value=t})),n.prepend(o),e.appendChild(n)}))}document.addEventListener("DOMContentLoaded",(function(){userNotes=document.getElementById("user-notes"),saveButton=document.getElementById("save-button"),savedNotes=localStorage.getItem("userNotes"),savedNotes&&(userNotes.value=savedNotes),saveButton.addEventListener("click",(function(){localStorage.setItem("userNotes",userNotes.value)}));const e=document.querySelector('input[type="submit"]');if(e){const t=document.querySelector('input[name="wish"]');e.addEventListener("click",(e=>{const n=t.value.trim();n&&(_1(n),_4())}))}_4(),_5()}));