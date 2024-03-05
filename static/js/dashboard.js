var tabButtons = document.querySelectorAll(".left-nav button");
var tabPanels = document.querySelectorAll(".content-container");

function showPanel(panelIndex){
    tabButtons.forEach(function (node)
    {
        node.style.backgroundColor = 'rgb(100, 185, 70)';
        node.style.color = 'white';
    });
    tabButtons[panelIndex].style.backgroundColor = 'white';
    tabButtons[panelIndex].style.color = 'rgb(100, 185, 70)';
    tabPanels.forEach(function (node)
    {
        node.style.display = 'none';
    });
    tabPanels[panelIndex].style.display = 'block';
}
showPanel(0);