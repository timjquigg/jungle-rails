describe("User Sign-up", () => {
  beforeEach(() => {
    cy.request("/cypress_rails_reset_state");
    cy.visit("/");
  });

  it("Allows a user to navigate to the sign up page", () => {
    cy.get(".navbar").find(".nav-link").contains("Sign Up").click();
    cy.get(".container").contains("Sign Up").should("be.visible");
  });

  it("Allows you to sign up", () => {
    cy.visit("/users/new");
    cy.get(".new_user #user_first_name").type("Jane");
    cy.get(".new_user #user_last_name").type("Doe");
    cy.get(".new_user #user_email").type("jane@example.com");
    cy.get(".new_user #user_password").type("password");
    cy.get(".new_user #user_password_confirmation").type("password");
    cy.get("form ").find("input[type=submit]").click();
    cy.get(".navbar").contains("Logged in as");
  });

  it("Gives an error if a field is left empty", () => {
    cy.visit("/users/new");
    // cy.get(".new_user #user_first_name").type("Jane");
    cy.get(".new_user #user_last_name").type("Doe");
    cy.get(".new_user #user_email").type("jane@example.com");
    cy.get(".new_user #user_password").type("password");
    cy.get(".new_user #user_password_confirmation").type("password");
    cy.get("form ").find("input[type=submit]").click();
    cy.get("body").contains("Oops");
  });

  it("Gives an error if e-mail already exists", () => {
    cy.visit("/users/new");
    cy.get(".new_user #user_first_name").type("John");
    cy.get(".new_user #user_last_name").type("Doe");
    cy.get(".new_user #user_email").type("john@example.com");
    cy.get(".new_user #user_password").type("password");
    cy.get(".new_user #user_password_confirmation").type("password");
    cy.get("form ").find("input[type=submit]").click();
    cy.get("body").contains("Oops");
  });
});

describe("User Log-in", () => {
  beforeEach(() => {
    cy.request("/cypress_rails_reset_state");
    cy.visit("/");
  });

  it("Allows a user to navigate to the log-in page", () => {
    cy.get(".navbar").find(".nav-link").contains("Log In").click();
    cy.get(".container").contains("Log In").should("be.visible");
  });

  it("Allows a user to log in with valid credentials", () => {
    cy.visit("/login");
    cy.get("#login_email").type("john@example.com");
    cy.get("#login_password").type("password");
    cy.get("form").find("input[type=submit]").click();
    cy.get(".navbar").contains("Logged in as");
  });

  it("Allows gives an error if invalid credentials", () => {
    cy.visit("/login");
    cy.get("#login_email").type("jo@example.com");
    cy.get("#login_password").type("password");
    cy.get("form").find("input[type=submit]").click();
    cy.get("body").contains("Incorrect");
  });
});
