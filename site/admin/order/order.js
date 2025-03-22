$(document).ready(function () {
    function loadOrders() {
        $.ajax({
            url: 'order_admin.php',
            type: 'GET',
            data: { opt: 'select' },
            dataType: 'json',
            success: function (response) {
                if (response.sucess) {
                    let rows = '';
                    response.orders.forEach(order => {
                        rows += `<tr>
                            <td>${order.number_order}</td>
                            <td>${order.users_id}</td>
                            <td>${order.id_sneakers}</td>
                            <td>${order.nom}</td>
                            <td>
                                <select class="order-status" data-id="${order.number_order}">
                                    <option value="en cours" ${order.etat_c === 'en cours' ? 'selected' : ''}>En cours</option>
                                    <option value="expédié" ${order.etat_c === 'expédié' ? 'selected' : ''}>Expédié</option>
                                    <option value="livré" ${order.etat_c === 'livré' ? 'selected' : ''}>Livré</option>
                                    <option value="finis" ${order.etat_c === 'finis' ? 'selected' : ''}>Finis</option>
                                </select>
                            </td>
                            <td>${order.date_de_commande}</td>
                            <td>
                                <button class="delete-order" data-id="${order.number_order}" ${order.etat_c !== 'finis' ? 'disabled' : ''}>Supprimer</button>
                            </td>
                        </tr>`;
                    });
                    $(".t-body").html(rows);
                } else {
                    alert("Erreur lors du chargement des commandes.");
                }
            }
        });
    }

    $(document).on("change", ".order-status", function () {
        let orderId = $(this).data("id");
        let newStatus = $(this).val();

        $.ajax({
            url: 'order_admin.php',
            type: 'POST',
            data: { opt: 'update', number_order: orderId, etat_c: newStatus },
            dataType: 'json',
            success: function (response) {
                if (response.sucess) {
                    alert("Statut mis à jour avec succès");
                    loadOrders();
                } else {
                    alert("Échec de la mise à jour du statut");
                }
            }
        });
    });

    $(document).on("click", ".delete-order", function () {
        let orderId = $(this).data("id");
        if (confirm("Êtes-vous sûr de vouloir supprimer cette commande ?")) {
            $.ajax({
                url: 'order_admin.php',
                type: 'POST',
                data: { opt: 'delete', number_order: orderId },
                dataType: 'json',
                success: function (response) {
                    if (response.sucess) {
                        alert("Commande supprimée");
                        loadOrders();
                    } else {
                        alert("Impossible de supprimer cette commande");
                    }
                }
            });
        }
    });

    loadOrders();
});