$(function(){
    function display(bool) {
        if (bool){
            $(".container").show()
            $(".box").hide()
            $(".box2").hide()
        } else {
            $(".container").hide()
        }
    }

    display(false)

    window.addEventListener("message", function(event){
        
        let item = event.data
        if (item.type === "ui"){
            if (item.status){
                display(true)
             }
             else {
                display(false)
             }
    }
})


    $(".close").click(function ()
    {$.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({})) })
    $("#garage").click(function ()
    {$.post(`https://${GetParentResourceName()}/main`, JSON.stringify )})
    $("#prova").click(function ()
    {$.post(`https://${GetParentResourceName()}/give`, JSON.stringify )})
    $("#ciaocaro").click(function ()
    {$.post(`https://${GetParentResourceName()}/astuzia`, JSON.stringify )})
    $(".info1").click(function (){
        $(".box").toggle()
    }
    )
    $(".info2").click(function (){
        $(".box2").toggle()
    }
    )
})
