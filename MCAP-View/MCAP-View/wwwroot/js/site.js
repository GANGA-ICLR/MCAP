// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


$(() => {
    let connection = new signalR.HubConnectionBuilder().withUrl("/signalServer").build()

    connection.start()

    connection.on("refreshTrades", function () {
        loadData()
    })

    loadData();

    function loadData() {
        var tr = ''

        $.ajax({
            url: '/Home/GetTrades?LoginId=IC-System',
            method: 'GET',
            success: (result) => {
                //  alert(JSON.stringify(result));
                $.each(result, (k, v) => {
                    tr = tr + `<tr>
                        
                    <td>${v.account}</td>
		            <td>${v.accountName}</td>
<td>${v.security}</td>
		            <td>${v.price}</td>
		            <td>${v.quantity}</td>
                  
                     <td>${v.tD_Quantity}</td>
		           <td>${v.tD_MarketValue}</td>
 
		            
		           
		            <td>${v.dv0}</td>
                    </tr>`
                })

                $("#tableBody").html(tr)
            },
            error: (error) => {
                console.log(error)
            }
        })
    }
})