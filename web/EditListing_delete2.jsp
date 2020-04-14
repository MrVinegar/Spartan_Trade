<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">

  <title>
    Service Request &middot;
  </title>

  <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link href="assets/css/toolkit-inverse.css" rel="stylesheet">

  <link href="assets/css/W3schools-edited.css" rel="stylesheet">
  <link href="assets/css/application.css" rel="stylesheet">
  <%@page import="Object.STList_ITEM"%>


  <style>
    /* note: this is a hack for ios iframe for bootstrap themes shopify page */
    /* this chunk of css is not part of the toolkit :) */
    body {
      width: 1px;
      min-width: 100%;
      *width: 100%;
    }
  </style>
</head>


<body>
  <div class="container">
    <div class="row">
      <div class="col-md-3 sidebar">
        <nav class="sidebar-nav">
          <div class="sidebar-header">
            <button class="nav-toggler nav-toggler-md sidebar-toggler" type="button" data-toggle="collapse"
              data-target="#nav-toggleable-md">
              <span class="sr-only">Toggle nav</span>
            </button>
            <a class="sidebar-brand img-responsive" href="index.html">
              <span class="icon sidebar-brand-icon"><img src="../spartan_logo.png" alt=""></span>

            </a>
          </div>

          <div class="collapse nav-toggleable-md" id="nav-toggleable-md">
            <form class="sidebar-form">
              <input class="form-control" type="text" placeholder="Search...">
              <button type="submit" class="btn-link">
                <span class="icon icon-magnifying-glass"></span>
              </button>
            </form>
            <ul class="nav nav-pills nav-stacked flex-column">
              <li class="nav-header">Dashboards</li>
              <li class="nav-item">
                <a class="nav-link" href="../index.html">Overview</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " data-toggle="modal" data-target="#exampleModalCenter">SIGN UP/LOGIN</a>
              </li>

              <li class="nav-item">
                <a class="nav-link active" href="order-history/index copy.html">Service Request</a>
              </li>

              <li class="nav-header">Categories</li>
              <li class="nav-item">
                <a class="nav-link " href="">
                  Category1
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="" target="blank">
                  Category2
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="">
                  Category3
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="" data-toggle="modal">
                  Category4
                </a>
              </li>
            </ul>
            <hr class="visible-xs mt-3">
          </div>
        </nav>
      </div>
      <div class="col-md-9 content ">
        <div class="dashhead">
          <div class="dashhead-titles">
            <h6 class="dashhead-subtitle">Dashboards</h6>
            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Item Editing</h2>
          </div>
        </div>

        <div class="pt-1 ml-1">
          <form class="needs-validation " novalidate>
    
            <p id="category1">2</p>
            <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
              <div class="form-group row">
                <div class="col-sm-4 text-info font-weight-bold">Category</div>
                <div class="col-sm-8">
                  <select class="custom-select custom-select-lg mb-3 text-success" id="categoryList" required>
                    <option value="">Please Select a Category</option>
                    <option value="1" id="">Textbooks</option>
                    <option value="2" id="">Services</option>
                    <option value="3" id="">Roommates</option>
                    <option value="4" id="">Supplies</option>
                  </select>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please Select a Category</div>
                </div>
              </div>
              <hr class="visible-xs" style="opacity: 0.3;">
              <div class="form-group">
                <label class="text-info font-weight-bold" for="item-title">Item Title</label>
                <input type="text" class="form-control" id="item-title" placeholder="iPhone X" required>
                <hr class="visible-xs" style="opacity: 0.3;">
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
              </div>

              <div class="form-group">
                <label class="text-info font-weight-bold" for="item-desc">Item Description</label>
                <textarea rows="4" id="item-desc" class="ember-text-area ember-view form-control"
                  placeholder="The curren fashion icon..." required></textarea>
                <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Made by Apple"> -->

                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              <hr class="visible-xs" style="opacity: 0.3;">
              <div class="form-group">
                <label class="text-info font-weight-bold" for="exampleInputFile">Images Uploads</label>
                <p><input type="file" id="exampleInputFile"></p>
              </div>
            </div>


            <p id="contact1">email</p>
            <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
              <div class="form-group row">
                <div class="col-sm-4 text-info font-weight-bold">Preferred Contact Method</div>
                <div class="col-sm-8">
                  <select class="custom-select custom-select-lg mb-3 text-success" id="contactMethod" required
                    onmouseout="numberToggle()">
                    <option value="">Choose a Contact Method</option>
                    <option value="call">Call</option>
                    <option value="text">Text</option>
                    <option value="email">Email</option>
                  </select>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please Select a Preferred Contact Method</div>
                </div>
              </div>


              <div class="form-group" id="phoneNumber">
                <label for="Number">Phone Number</label>
                <input type="number" class="form-control" id="Number" placeholder="Please enter your phone number"
                  required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
              </div>

              <hr class="visible-xs" style="opacity: 0.3;">

              <div class="form-group">
                <label class="form-check-label text-warning">
                  <input class="form-check-input " type="checkbox" name="remember" required> I agree on <a href="">Terms
                    & Conditions</a>.
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">You must agree before submitting.</div>
                </label>
              </div>
            </div>
            <button type="submit" class="btn btn-default btn-primary mt-5" id="submit">Submit Changes</button>

            <div class="clearfix">
              <a class="float-right text-primary"
                href="https://docs.google.com/forms/d/e/1FAIpQLSfVInBReL6jOT4gp7yr4a5wM-FbeHyoVobUfpJr9MqFZmMBPA/viewform?usp=sf_link"
                target="_blank" rel="noopener noreferrer">Feedback?</a>
            </div>
          </form>


          <!-- <div class="container"> -->
          <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
      <a href="/app/" id="ember394" class="ember-view navbar-brand">RTD Pro</a>
      <button class="navbar-toggler collapsed" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
        aria-expanded="false" aria-label="Toggle navigation" type="button">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse" id="navbarNav" style="">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a href="/app/builds" id="ember395" class="ember-view nav-link">Builds</a>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              vince568
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a href="/app/my-builds" id="ember396" class="ember-view dropdown-item">My Builds</a>
              <a href="/app/create-build" id="ember397" class="active ember-view dropdown-item">Create a Build</a>
              <a class="dropdown-item" href="/password_change/">Change Password</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="/logout/">Logout</a>
            </div>
          </li>
        </ul>
      </div>
    </nav> -->


          <!-- <div class="container">
    <h2 class="my-4">Create a build</h2>
    <form>
  
    <div class="form-group">
      <label for="title">Title</label>
      <input id="title" class="ember-text-field ember-view form-control" type="text">
    </div>
  
    <div class="form-group">
      <div class="form-check form-check-inline">
        <input name="character-class" id="warrior" class="ember-text-field ember-view form-check-input" type="radio" value="warrior">
        <label class="form-check-label" for="warrior">Warrior</label>
      </div>
      <div class="form-check form-check-inline">
        <input name="character-class" id="mage" class="ember-text-field ember-view form-check-input" type="radio" value="mage">
        <label class="form-check-label" for="mage">Mage</label>
      </div>
      <div class="form-check form-check-inline">
        <input name="character-class" id="ranger" class="ember-text-field ember-view form-check-input" type="radio" value="ranger">
        <label class="form-check-label" for="ranger">Ranger</label>
      </div>
    </div> 
  
    
  
     <div class="form-group">
      <label for="description">Description</label>
      <textarea id="description" class="ember-text-area ember-view form-control"></textarea>  </div>
  
    <button class="btn btn-primary" disabled="" type="submit">Create</button>
  </form> -->


        </div>
        <!-- Inline Form -->




      </div>
    </div>
  </div>





  <script src="../assets/js/jquery.min.js"></script>
  <script src="../assets/js/tether.min.js"></script>
  <script src="../assets/js/chart.js"></script>
  <script src="../assets/js/tablesorter.min.js"></script>
  <script src="../assets/js/toolkit.js"></script>
  <script src="../assets/js/application.js"></script>
  <script>

    $(document).ready(function ($) {
      
      var contactMethod = document.getElementById('contact1').innerHTML;
      var user_info = document.getElementById("phoneNumber");
      var contactMethodOption = document.getElementById('contactMethod');

      contactMethodOption.value = contactMethod;
      if (contactMethod === "call") {
        user_info.style.display = "block";
      } else {

      user_info.style.display = "none";
      };

      var category = document.getElementById('category1').innerHTML;
      var categoryOption = document.getElementById('categoryList');
      categoryOption.value = category;

      

      
    });
    (function () {
      'use strict';
      window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();

    // execute/clear BS loaders for docs
    $(function () { while (window.BS && window.BS.loader && window.BS.loader.length) { (window.BS.loader.pop())() } })

    const selectElement = document.querySelector('.categoryoption');

    selectElement.addEventListener('change', (event) => {
      const result = document.querySelector('.result');
      result.textContent = `You like ${event.target.value}`;
    });

    document.getElementById("call").click = function () {
      alert("fsadfas");
      document.getElementById("callInput").display = "inline";
    }
  </script>
</body>

</html>