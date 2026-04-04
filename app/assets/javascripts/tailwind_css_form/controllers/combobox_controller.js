import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="combobox"
export default class extends Controller {
  static targets = ["input", "button", "list", "option", "filter"]
  static values = {
    filter: Boolean
  }

  toggle() {
    if (this.filterValue && document.activeElement == this.filterTarget && !this.listTarget.classList.contains('hidden')) {
      return;
    }
    if (this.filterValue && document.activeElement != this.filterTarget && this.listTarget.classList.contains('hidden')) {
      return;
    }
    this.listTarget.classList.toggle('hidden')
  }

  selected(event) {
    let elem = event.target.closest('.relative')
    this.switchSelectedOptionInList(elem)
    this.showSelectedOption(elem)
    this.changeHiddenValue(elem)

    if (!this.filterValue) {
      setTimeout(() => this.toggle(), 150)
    }
  }

  switchSelectedOptionInList(elem) {
    this.optionTargets.forEach((element) => {
      if (element == elem) {
        element.querySelector('span.flex').classList.remove('opacity-0')
        element.querySelector('span.flex').classList.add('opacity-100')
      } else {
        element.querySelector('span.flex').classList.add('opacity-0')
        element.querySelector('span.flex').classList.remove('opacity-100')
      }
    })
  }

  showSelectedOption(elem) {
    if (this.filterValue) {
      this.filterTarget.value = elem.querySelector('.truncate').innerText
    } else {
      this.buttonTarget.querySelector('.truncate').innerText = elem.querySelector('.truncate').innerText
      this.buttonTarget.children[0].children[0].replaceWith(elem.children[0].children[0].cloneNode(true))
    }
  }

  changeHiddenValue(elem) {
    this.inputTarget.value = elem.dataset.id
    const e = new Event("change")
    this.inputTarget.dispatchEvent(e)
  }

  input(event) {
    this.optionTargets.forEach((element) => {
      if (element.dataset.name.indexOf(this.filterTarget.value) > -1) {
        element.classList.remove('hidden')
      } else {
        element.classList.add('hidden')
      }
    })
  }
}
