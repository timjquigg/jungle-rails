describe("home page", () => {
  beforeEach(() => {
    //
  });

  it("displays the home page", () => {
    cy.visit("http://localhost:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
