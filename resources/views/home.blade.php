@extends('layouts.app')

@section('content')

<div class="container">
    <h1>Vehicle Dashboard</h1>
    <div id="message-container"></div>
    <table class="table" id="vehicles-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Plate Number</th>
                <th>Insurance Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="pagination">
        <button id="prev-page" class="btn btn-dark">Previous</button>

        <button id="next-page" class="btn btn-dark ms-2">Next</button>
        <span id="current-page" class="ms-auto">1</span>

    </div>

    <hr class="my-5 fw-5">

    <div class="container">
        <h2 class="mt-2 mb-4">Create Vehicle</h2>
        <form id="create-vehicle-form" class="row g-3">
            <div class="col-md-6">
                <label for="brand" class="form-label">Brand</label>
                <input type="text" class="form-control" id="brand" placeholder="Brand" required>
            </div>
            <div class="col-md-6">
                <label for="model" class="form-label">Model</label>
                <input type="text" class="form-control" id="model" placeholder="Model" required>
            </div>
            <div class="col-md-6">
                <label for="plate_number" class="form-label">Plate Number</label>
                <input type="text" class="form-control" id="plate_number" placeholder="Plate Number" required>
            </div>
            <div class="col-md-6">
                <label for="insurance_date" class="form-label">Insurance Date</label>
                <input type="date" class="form-control" id="insurance_date" placeholder="Insurance Date" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </form>
    </div>

    <div class="container mt-4">
        <h2>Edit Vehicle</h2>
        <form id="edit-vehicle-form" class="row g-3">
            <input type="hidden" id="edit-id">
            <div class="col-md-6">
                <label for="edit-brand" class="form-label">Brand</label>
                <input type="text" class="form-control" id="edit-brand" placeholder="Brand" required>

            </div>
            <div class="col-md-6">
                <label for="edit-model" class="form-label">Model</label>
                <input type="text" class="form-control" id="edit-model" placeholder="Model" required>
            </div>
            <div class="col-md-6">
                <label for="edit-plate_number" class="form-label">Plate Number</label>
                <input type="text" class="form-control" id="edit-plate_number" placeholder="Plate Number" required>
            </div>
            <div class="col-md-6">
                <label for="edit-insurance_date" class="form-label">Insurance Date</label>
                <input type="date" class="form-control" id="edit-insurance_date" placeholder="Insurance Date" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
    <script>
        let currentPage = 1;

        function loadVehicles(page = 1) {
            $.ajax({
                url: '/api/vehicles',
                type: 'GET',
                data: {
                    page: page,
                    per_page: 10
                },
                success: function(data) {
                    let tbody = $('#vehicles-table tbody');
                    tbody.empty();
                    data.data.forEach(vehicle => {
                        tbody.append(`
                            <tr>
                                <td>${vehicle.id}</td>
                                <td>${vehicle.brand}</td>
                                <td>${vehicle.model}</td>
                                <td>${vehicle.plate_number}</td>
                                <td>${vehicle.insurance_date}</td>
                                <td>
                                    <button onclick="editVehicle(${vehicle.id})" class="btn btn-warning">Edit</button>
                                    <button onclick="deleteVehicle(${vehicle.id})" class="btn btn-danger">Delete</button>
                                </td>
                            </tr>
                        `);
                    });

                    currentPage = data.current_page;
                    $('#current-page').text(currentPage);
                    $('#prev-page').prop('disabled', !data.prev_page_url);
                    $('#next-page').prop('disabled', !data.next_page_url);
                },
                error: function(xhr, status, error) {
                    console.error('Error loading vehicles:', error);
                }
            });
        }

        function editVehicle(id) {
            $.ajax({
                url: '/api/vehicles/' + id,
                type: 'GET',
                success: function(data) {
                    $('#edit-id').val(data.id);
                    $('#edit-brand').val(data.brand);
                    $('#edit-model').val(data.model);
                    $('#edit-plate_number').val(data.plate_number);
                    $('#edit-insurance_date').val(data.insurance_date);
                    $('html, body').animate({
                        scrollTop: $("#edit-vehicle-form").offset().top
                    }, 'slow');
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching vehicle data:', error);
                }
            });
        }

        function deleteVehicle(id) {
            $.ajax({
                url: '/api/vehicles/' + id,
                type: 'DELETE',
                success: function() {
                    $('#message-container').show();
                    $('#message-container').html('<div class="alert alert-success" role="alert">Vehicle deleted successfully!</div>');
                    $('html, body').animate({
                        scrollTop: $("#message-container")
                    }, 'slow');

                    setTimeout(function() {
                        $('#message-container').hide();
                    }, 2500);
                    loadVehicles(currentPage);
                },
                error: function(xhr, status, error) {
                    console.error('Error deleting vehicle:', error);
                }
            });
        }

        $(document).ready(function() {
            $('#create-vehicle-form').on('submit', function(e) {
                e.preventDefault();
                $.ajax({
                    url: '/api/vehicles',
                    type: 'POST',
                    data: {
                        brand: $('#brand').val(),
                        model: $('#model').val(),
                        plate_number: $('#plate_number').val(),
                        insurance_date: $('#insurance_date').val(),
                    },
                    success: function() {
                        // Display success message
                        $('#message-container').show();
                        $('#message-container').html('<div class="alert alert-success" role="alert">Vehicle created successfully!</div>');
                        // Reload the page after a short delay
                        $('html, body').animate({
                            scrollTop: $("#message-container")
                        }, 'slow');
                        setTimeout(function() {
                            window.location.reload();
                        }, 2500);
                    },
                    error: function(xhr, status, error) {
                        // Handle validation errors
                        if (xhr.responseJSON && xhr.responseJSON.errors) {
                            let errors = xhr.responseJSON.errors;
                            $('#message-container').show();
                            let errorMessage = '<div class="alert alert-danger" role="alert"><ul>';
                            $.each(errors, function(key, value) {
                                errorMessage += '<li>' + value + '</li>';
                            });
                            errorMessage += '</ul></div>';
                            $('#message-container').html(errorMessage);

                            $('html, body').animate({
                                scrollTop: $("#message-container")
                            }, 'slow');

                            setTimeout(function() {
                                $('#message-container').hide();
                            }, 2500);
                        } else {
                            console.error('Error creating vehicle:', error);
                        }
                    }
                });
            });
            $('#edit-vehicle-form').on('submit', function(e) {
                e.preventDefault();
                const id = $('#edit-id').val();
                $.ajax({
                    url: '/api/vehicles/' + id,
                    type: 'PUT',
                    data: {
                        brand: $('#edit-brand').val(),
                        model: $('#edit-model').val(),
                        plate_number: $('#edit-plate_number').val(),
                        insurance_date: $('#edit-insurance_date').val(),
                    },
                    success: function() {
                        $('#message-container').show();
                        $('#message-container').html('<div class="alert alert-success" role="alert">Vehicle updated successfully!</div>');
                        $('html, body').animate({
                            scrollTop: $("#message-container")
                        }, 'slow');

                        setTimeout(function() {
                            $('#message-container').hide();
                        }, 2500);
                        loadVehicles();

                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating vehicle:', error);
                    }
                });
            });
            $('#prev-page').on('click', function() {
                if (currentPage > 1) {
                    loadVehicles(currentPage - 1);
                }
            });

            $('#next-page').on('click', function() {
                loadVehicles(currentPage + 1);
            });

            // Initial load
            loadVehicles();
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</div>

@endsection