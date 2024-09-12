defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    letter =
      name
      |> first_letter()
      |> String.upcase()

    "#{letter}."
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name, " ")

    "#{initial(first_name)} #{initial(last_name)}"
  end

  def pair(full_name1, full_name2) do
    i_1 = initials(full_name1)
    i_2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i_1}  +  #{i_2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
