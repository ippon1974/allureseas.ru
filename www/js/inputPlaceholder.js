/*
 *  © Студия Артемия Лебедева

/*        Методы:
 *                отсутствуют
 *
 *        Свойства
 *                Input                        Элемент формы, с которым работаем
 *                Value                        Значение надписи по умолчанию
 *                CssFilled                Имя css-класса для отображения заполненого поля
 *                CssEmpty                Имя css-класса для отображения пустого поля
 */

/*        Конструктор
 *        Параметры:
 *                input                        Элемент формы ( input[@type='text'] ), с которым работаем
 *                value                        Значение надписи по умолчанию, т. е. тот самый placeholder
 *                cssFilled                Имя css-класса для отображения заполненого поля (применяется к input)
 *                cssEmpty                Имя css-класса для отображения пустого поля (применяется к input)
 */

function InputPlaceholder (input, value, cssFilled, cssEmpty)
{
        var thisCopy = this

        this.Input = input
        this.Value = value
        this.SaveOriginal = (input.value == value)
        this.CssFilled = cssFilled
        this.CssEmpty = cssEmpty

        this.setupEvent (this.Input, 'focus', function() {return thisCopy.onFocus()})
        this.setupEvent (this.Input, 'blur',  function() {return thisCopy.onBlur()})
        this.setupEvent (this.Input, 'keydown', function() {return thisCopy.onKeyDown()})

        if (input.value == '') this.onBlur();

        return this
}

InputPlaceholder.prototype.setupEvent = function (elem, eventType, handler)
{
        if (elem.attachEvent)
        {
                elem.attachEvent ('on' + eventType, handler)
        }

        if (elem.addEventListener)
        {
                elem.addEventListener (eventType, handler, false)
        }
}

InputPlaceholder.prototype.onFocus = function()
{
        if (!this.SaveOriginal &&  this.Input.value == this.Value)
        {
                this.Input.value = ''
        }
        else
        {
                        this.Input.className = this.CssFilled;
        }
}

InputPlaceholder.prototype.onKeyDown = function()
{
        this.Input.className = this.CssFilled;
}

InputPlaceholder.prototype.onBlur = function()
{
        if (this.Input.value == '' || this.Input.value == this.Value)
        {
                this.Input.value = this.Value
                this.Input.className = this.CssEmpty
        }
        else
        {
                this.Input.className = this.CssFilled
        }
}
